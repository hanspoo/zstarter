export function Centered({ children }: React.PropsWithChildren) {
  return (
    <div className="flex justify-center h-screen w-full items-center ">
      {children}
    </div>
  );
}
